using UnityEngine;
using UnityEngine.Networking;

namespace TheMazeWhisperer.Multiplayer
{
    public class PlayerSetup : NetworkBehaviour
    {
        public void Start()
        {
            GameObject tagContainer = new GameObject("Tag Container");
            tagContainer.transform.SetParent(transform);

            if(isLocalPlayer)
            {
                GameObject localPlayerTag = new GameObject("Local Player");
                localPlayerTag.transform.SetParent(tagContainer.transform);
                localPlayerTag.tag = localPlayerTag.name;

                return;
            }

            foreach(Behaviour behavior in GetComponents<Behaviour>())
            {
                if(!(behavior is NetworkIdentity))
                {
                    behavior.enabled = false;
                }
            }

            for(int index = 0; index < transform.childCount; index++)
            {
                transform.GetChild(index).gameObject.SetActive(false);
            }
        }
    }
}