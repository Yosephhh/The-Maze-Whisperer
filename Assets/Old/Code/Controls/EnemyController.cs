using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    public GameObject player;
    public float speed = 7f;
    private const float yPos = 0;
    public float distance = 10f;
    private GameObject[] movePoints;

    private Vector3 lastPos = Vector3.zero;
    private GameObject closestMovePoint = null;
    private List<GameObject> traveledPoints = new List<GameObject>();
    private bool chasing = false;
    private bool runDownHall = false;
    // Use this for initialization
    void Start()
    {
        movePoints = GameObject.FindGameObjectsWithTag("TravelPoint");
    }

    // Update is called once per frame
    void Update()
    {
        if (player != null)
        {
            RaycastHit hit;
            Vector3 direction = getTravelDirection(player);
            Ray enemySight = new Ray(transform.position, direction);
            if (Physics.Raycast(enemySight, out hit, distance))
            {
                if (hit.collider.tag != "Player" && chasing)
                {
                    // retrieves the last known position
                    if (lastPos == Vector3.zero)
                    {
                        lastPos = player.transform.position;
                        Debug.Log("LOST! Last Known Position: " + lastPos);
                    }
                    // getting through doors
                    if (!runDownHall && (closestMovePoint == null || Vector3.Distance(transform.position, closestMovePoint.transform.position) <= 0.02f))
                    {
                        Debug.Log("Need to move to a new room");
                        //if the player can't see the direct point in which the player was last at, get out of the doorway
                        enemySight = new Ray(transform.position, lastPos);
                        if(Physics.Raycast(enemySight, out hit, distance) && hit.collider.tag != "Player")
                        {
                            Debug.Log("Time To Go Through Doorway");
                            closestMovePoint = getNearestMovePoint(traveledPoints);
                            traveledPoints.Add(closestMovePoint);
                        } else // if he does, run down the hall
                        {
                            Debug.Log("Time To Chase Down the Hall");
                            GameObject lastPlayerLoc = new GameObject();
                            lastPlayerLoc.transform.position = lastPos;
                            direction = getTravelDirection(lastPlayerLoc);
                            if(Math.Abs(direction.x) > Math.Abs(direction.z))
                            {
                                direction = new Vector3(0, direction.y, direction.z);
                            } else
                            {
                                direction = new Vector3(direction.x, direction.y, 0);
                            }
                            runDownHall = true;
                        }
                    }
                    if(closestMovePoint != null) // run out the door
                    { 
                        direction = getTravelDirection(closestMovePoint);
                    } else // if he finds nowhere else to look, it is destroyed
                    {
                        Destroy(this);
                    }
                } else if(hit.collider.tag == "Player")
                {
                    Debug.Log("There you are!");
                    lastPos = Vector3.zero;
                    chasing = true;
                    runDownHall = false;
                } else
                {
                    direction = Vector3.zero;
                }
            }
            this.GetComponent<Rigidbody>().velocity = new Vector3(direction.x * speed, 0f, direction.z * speed);
        }
    }

    private Vector3 getTravelDirection(GameObject obj)
    {
        float objX = obj.transform.position.x, objZ = obj.transform.position.z, enemyX = this.transform.position.x, enemyZ = this.transform.position.z;
        float adj = enemyZ - objZ;
        float opp = enemyX - objX;
        if (enemyZ > objZ)
        {
            adj = -1 * Math.Abs(adj);
        }
        else
        {
            adj = Math.Abs(adj);
        }

        if (enemyX > objX)
        {
            opp = -1 * Math.Abs(opp);
        }
        else
        {
            opp = Math.Abs(opp);
        }

        float hyp = (float)Math.Sqrt(Math.Pow(adj, 2) + Math.Pow(opp, 2));
        float sin = opp / hyp;
        float cos = adj / hyp;

        return new Vector3(sin, yPos, cos);
    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            collision.gameObject.GetComponent<PlayerModule>().Kill();
        }
    }

    private GameObject getNearestMovePoint(List<GameObject> exclude)
    {
        GameObject closest = null;
        foreach (GameObject movePoint in movePoints)
        {
            if(!exclude.Contains(movePoint))
            {
                RaycastHit hit;
                Ray pointSight = new Ray(transform.position, getTravelDirection(movePoint));
                float dist = Vector3.Distance(transform.position, movePoint.transform.position);
                if (!Physics.Raycast(pointSight, out hit, dist))
                {
                    if (closest == null || dist < Vector3.Distance(transform.position, closest.transform.position))
                    {
                        closest = movePoint;
                    }
                }
            }
        }
        return closest;
    }
}
