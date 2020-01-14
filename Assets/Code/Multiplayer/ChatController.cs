using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using UnityEngine.Networking.NetworkSystem;
using UnityStandardAssets.Characters.FirstPerson;

namespace TheMazeWhisperer.Multiplayer
{
    public class ChatController : MonoBehaviour
    {
        public GameObject Container;
        public GameObject TextContainer;
        public InputField InputField;

        public GameObject RemoteText;
        public GameObject LocalText;

        private ScrollRect scrollRect;

        private MonoBehaviour playerController;

        protected MonoBehaviour PlayerController
        {
            get
            {
                if(playerController == null)
                {
                    GameObject localPlayer = GameObject.FindGameObjectWithTag("Local Player").transform.parent.parent.gameObject;

                    playerController = localPlayer.GetComponent<GodCameraController>();

                    if(playerController == null)
                    {
                        playerController = localPlayer.GetComponent<FirstPersonController>();
                    }
                }

                return playerController;
            }
        }

        private const short chatMessageType = 131;

        public void Start()
        {
            InputField.onEndEdit.AddListener(delegate { onTextEditComplete(InputField); });

            scrollRect = Container.GetComponentInChildren<ScrollRect>();

            if(NetworkServer.active)
            {
                NetworkServer.RegisterHandler(chatMessageType, onServerMessageRecieved);
            }

            NetworkManager.singleton.client.RegisterHandler(chatMessageType, onMessageRecieved);
        }

        public void Update()
        {
            if(Input.GetKeyDown(KeyCode.T) && !InputField.isFocused)
            {
                PlayerController.enabled = false;
                InputField.gameObject.SetActive(!InputField.gameObject.activeInHierarchy);
                InputField.Select();
                InputField.ActivateInputField();
            }
        }

        private void onTextEditComplete(InputField field)
        {
            PlayerController.enabled = true;

            if(field.text != string.Empty)
            {
                StringMessage message = new StringMessage(field.text);

                NetworkManager.singleton.client.Send(chatMessageType, message);

                updateChatBox(field.text, true);
            }

            field.text = string.Empty;

            InputField.gameObject.SetActive(!InputField.gameObject.activeInHierarchy);
        }

        private void onServerMessageRecieved(NetworkMessage message)
        {
            foreach(NetworkConnection connection in NetworkServer.connections)
            {
                if(connection.connectionId != message.conn.connectionId)
                {
                    NetworkServer.SendToClient(connection.connectionId, chatMessageType, message.ReadMessage<StringMessage>());
                }
            }

            NetworkServer.SendToAll(chatMessageType, message.ReadMessage<StringMessage>());
        }

        private void onMessageRecieved(NetworkMessage message)
        {
            updateChatBox(message.ReadMessage<StringMessage>().value, false);
        }

        private void updateChatBox(string message, bool isLocal)
        {
            GameObject text = null;

            if(isLocal)
            {
                text = Instantiate(LocalText, TextContainer.transform);
            }
            else
            {
                text = Instantiate(RemoteText, TextContainer.transform);
            }

            if(text != null)
            {
                text.transform.SetSiblingIndex(TextContainer.transform.childCount);
                text.GetComponent<Text>().text = message;

                Canvas.ForceUpdateCanvases();
                scrollRect.verticalNormalizedPosition = 0f;
                Canvas.ForceUpdateCanvases();
            }
        }
    }
}