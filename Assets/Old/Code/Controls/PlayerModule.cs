using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.Characters.FirstPerson;

public class PlayerModule : MonoBehaviour {

    private bool isAlive = true;
    public GameObject gameOverCanvas;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void Kill ()
    {
        this.GetComponent<FirstPersonController>().enabled = false;
        gameOverCanvas.SetActive(true);
    }
}
