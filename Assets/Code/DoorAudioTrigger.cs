using UnityEngine;

namespace TheMazeWhisperer
{
    public class DoorAudioTrigger : MonoBehaviour
    {
        [SerializeField]
        private AudioSource audioSource;

        [SerializeField]
        private AudioClip audioClip;

        public void OnCollisionEnter(Collision collision)
        {
            audioSource.PlayOneShot(audioClip, 1.0f);
        }
    }
}