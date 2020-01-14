using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using TheMazeWhisperer.UI;

namespace TheMazeWhisperer.Multiplayer
{
    public class LobbyManager : NetworkLobbyManager
    {
        #region Serialized Fields

        [SerializeField]
        private PageController PageController;

        [SerializeField]
        private GameObject ChatPrefab;

        #endregion

        public override void OnStartClient(NetworkClient client)
        {
            base.OnStartClient(client);

            PageController.FindPage<LobbyMenuController>().ActivatePage();
        }

        public override void OnStopClient()
        {
            base.OnStopClient();

            PageController.FindPage<MainMenuController>().ActivatePage();
        }

        public override GameObject OnLobbyServerCreateGamePlayer(NetworkConnection connection, short playerControllerId)
        {
            if(connection.address == "localClient")
            {
                return Instantiate(spawnPrefabs[0]);
            }

            return Instantiate(spawnPrefabs[1]);
        }

        //public override bool OnLobbyServerSceneLoadedForPlayer(GameObject lobbyPlayer, GameObject gamePlayer)
        //{
        //    Instantiate(ChatPrefab);

        //    return base.OnLobbyServerSceneLoadedForPlayer(lobbyPlayer, gamePlayer);
        //}

        public void AgnosticTerminate()
        {
            if(NetworkServer.active)
            {
                StopHost();
            }
            else
            {
                StopClient();
            }
        }
    }
}