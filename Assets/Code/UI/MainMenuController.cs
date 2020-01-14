using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

namespace TheMazeWhisperer.UI
{
    public class MainMenuController : Page
    {
        private const string lastIpKey = "LastIP";

        #region Serialized Fields

        [SerializeField]
        private Text localIpLabel;

        [SerializeField]
        private InputField usernameField;

        [SerializeField]
        private InputField ipAddressField;

        [SerializeField]
        private Button directConnectButton;

        [SerializeField]
        private Button hostGameButton;

        [SerializeField]
        private Button quitButton;

        #endregion

        private string ipAddress;

        protected override void Start()
        {
            usernameField.text = "MazePlayer" + Random.Range(0, 999);

            ipAddressField.onEndEdit.AddListener(ipAddressField_EditComplete);
            directConnectButton.onClick.AddListener(directConnectButton_Clicked);
            hostGameButton.onClick.AddListener(hostGameButton_Clicked);
            quitButton.onClick.AddListener(quitButton_Clicked);

            ipAddressField.text = ipAddress = PlayerPrefs.GetString(lastIpKey);
        }

        protected override void OnPageActivated()
        {
            localIpLabel.text = "Local :" + Network.player.ipAddress;
        }

        private bool isFieldPopulated(InputField inputField)
        {
            if(inputField.text == string.Empty)
            {
                inputField.Select();
                inputField.ActivateInputField();

                return false;
            }

            return true;
        }

        private void ipAddressField_EditComplete(string text)
        {
            PlayerPrefs.SetString(lastIpKey, text);
            ipAddress = text;
        }

        private void directConnectButton_Clicked()
        {
            if(isFieldPopulated(usernameField) && isFieldPopulated(ipAddressField))
            {
                NetworkManager.singleton.networkAddress = ipAddress;
                NetworkManager.singleton.StartClient();
            }
        }

        private void hostGameButton_Clicked()
        {
            if(isFieldPopulated(usernameField))
            {
                NetworkManager.singleton.StartHost();
            }
        }

        private void quitButton_Clicked()
        {
            Application.Quit();
        }
    }
}