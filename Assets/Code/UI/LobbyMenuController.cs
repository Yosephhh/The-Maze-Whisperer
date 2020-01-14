using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;
using TheMazeWhisperer.Multiplayer;

namespace TheMazeWhisperer.UI
{
    public class LobbyMenuController : Page
    {
        #region Serialized Fields

        [SerializeField]
        private Text localIpLabel;

        [SerializeField]
        private Button disconnectButton;

        #endregion

        protected override void Start()
        {
            disconnectButton.onClick.AddListener(disconnectButton_Clicked);
        }

        protected override void OnPageActivated()
        {
            localIpLabel.text = "Local : " + Network.player.ipAddress;

            (NetworkManager.singleton as LobbyManager).showLobbyGUI = true;
        }

        protected override void OnPageDeactivated()
        {
            (NetworkManager.singleton as LobbyManager).showLobbyGUI = false;
        }

        private void disconnectButton_Clicked()
        {
            (NetworkManager.singleton as LobbyManager).AgnosticTerminate();
        }
    }
}