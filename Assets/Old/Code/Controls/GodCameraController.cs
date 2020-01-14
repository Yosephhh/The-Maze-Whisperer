using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GodCameraController : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        Vector3 mousePosition = Input.mousePosition;
        float xAxis = this.transform.position.x, yAxis = this.transform.position.y, zAxis = this.transform.position.z;
        if (mousePosition.x < 10)
        {
            xAxis -= 0.5f;
        } else if (mousePosition.x > Screen.width - 10)
        {
            xAxis += 0.5f;
        } else
        {
            xAxis += Input.GetAxis("Horizontal");
        }

        if (mousePosition.y < 10)
        {
            zAxis -= 0.5f;
        }
        else if (mousePosition.y > Screen.height - 10)
        {
            zAxis += 0.5f;
        }
        else
        {
            zAxis += Input.GetAxis("Vertical");
        }

        yAxis = this.transform.position.y + Input.GetAxis("Mouse ScrollWheel") * -10; // Scroll Up - Zooms In

        if(Input.GetKey(KeyCode.Minus))
        {
            yAxis = this.transform.position.y + 0.5f;
        }
        if(Input.GetKey(KeyCode.Equals))
        {
            yAxis = this.transform.position.y - 0.5f;
        }

        this.transform.position = new Vector3(xAxis, yAxis, zAxis);
	}
}