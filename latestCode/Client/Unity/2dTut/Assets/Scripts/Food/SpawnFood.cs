﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

 public enum FoodType{
    none,
    apple,
    avocado,
    banana,
    cherries,
    lemon,
    peach,
    peanut,
    pear,
    strawberry,
    watermelon
}

public class SpawnFood : MonoBehaviour {

    // Food Prefab
    public GameObject food;
    
    // Borders (out of range spwan avoid)
    public Transform border_Top;
    public Transform border_Bottom;
    public Transform border_Left;
    public Transform border_Right;
    public GameObject FoodParent;

    private float food_size = Global.food_size;
    private float food_halo_size = Global.food_halo_size;

    //private bool isGameStart = false;

    private bool FoodSpwanState = false; // Food spwan flag

    public int FoodMaxPool = 30;     // Food count
    private MemoryPool MPool;   // MemoryPool
    public GameObject[] FoodprefabArray { get; set; }   //FoodArray Used with MemoryPool

    private float FoodspwanDelay = Global.FoodSpawnDelay;

    // Called when game is closed 게임이 종료되면 자동으로 호출되는 함수
    private void OnApplicationQuit()
    {
        MPool.Dispose();    // clear memory pool, 메모리 풀 정리
    }

    // Use this for initialization
    void Start () {

        // Food Spawn 가능 상태로 변경
        // FoodSpwanState = true;

        // MemeoryPool Init
        MPool = new MemoryPool();
        MPool.Create(food, FoodMaxPool,FoodParent.transform);

        // Food 배열 초기화
        FoodprefabArray = new GameObject[FoodMaxPool];

        // Spawn food every 4 seconds, starting in 0.5
        // InvokeRepeating("Spawnf", 0.5f, 4f);
    }

    private void FixedUpdate()
    {
        //매 프레임마다 spwanf 확인
        Spawnf();
    }



    //Spawn one piece of food
    //now it spawn random food using 'INT' position!
    void Spawnf()
    {
        if (FoodSpwanState)
        {
            // 시간 대기를 위한 코루틴 실행
            StartCoroutine(FoodspawnCycleControl());

            // Memory Pool 에서 생성되지 않은 먹이를 찾아서 생성
            for (int i = 0; i < FoodMaxPool; i++)
            {
                if (FoodprefabArray[i] == null)
                {
                    FoodprefabArray[i] = MPool.NewItem();
                    //x position between left and right border
                    float x = (float)Random.Range(border_Left.position.x,
                                              border_Right.position.x);
                    //y position between top and bottom border
                    float y = (float)Random.Range(border_Top.position.y,
                                              border_Bottom.position.y);

                    float z = -(float)food_size;

                    FoodprefabArray[i].transform.position = new Vector3(x, y, z);
                    FoodprefabArray[i].transform.localScale = new Vector3(food_size, food_size, food_size);

                    FoodprefabArray[i].GetComponent<Light>().color = new Color32(255, 255, 255,255);
                    FoodprefabArray[i].GetComponent<Light>().range = food_halo_size;

                    FoodprefabArray[i].GetComponent<foodinfo>().type = (FoodType)Random.Range(0, 11);
                    break;

                }
            }
        }
        for (int i = 0; i < FoodMaxPool; i++)
        {
            if (FoodprefabArray[i])
            {
                if (FoodprefabArray[i].activeSelf == false) 
                {
                    FoodprefabArray[i].SetActive(true);
                    MPool.RemoveItem(FoodprefabArray[i]);
                    FoodprefabArray[i] = null;
                }
            }
        }
    }


    IEnumerator FoodspawnCycleControl()
    {
        FoodSpwanState = false;
        yield return new WaitForSeconds(FoodspwanDelay);
        FoodSpwanState = true;
    }


    public void FoodSpawnStart()
    {
        FoodSpwanState = true;
    }

    public void spawnfood()
    {
        for (int i = 0; i < FoodMaxPool; i++)
        {
            if (FoodprefabArray[i] == null)
            {
                FoodprefabArray[i] = MPool.NewItem();
                //x position between left and right border
                float x = (float)Random.Range(border_Left.position.x,
                                          border_Right.position.x);
                //y position between top and bottom border
                float y = (float)Random.Range(border_Top.position.y,
                                          border_Bottom.position.y);

                float z = -(float)food_size;

                FoodprefabArray[i].transform.position = new Vector3(x, y, z);
                FoodprefabArray[i].transform.localScale = new Vector3(food_size, food_size, food_size);

                FoodprefabArray[i].GetComponent<Light>().color = new Color32(255, 255, 255, 255);
                FoodprefabArray[i].GetComponent<Light>().range = food_halo_size;

                FoodprefabArray[i].GetComponent<foodinfo>().type = (FoodType)Random.Range(0, 11);
                break;

            }
        }
    }

    public void SpawnFood_die(Transform tf, Color color)
    {
        float z = -3f;
        Transform fd = Instantiate(
            food,
            new Vector3(tf.position.x, tf.position.y, z),
            Quaternion.identity).transform; // default rotation

        fd.GetComponent<Light>().color = color;
        fd.GetComponent<Light>().intensity = 1.5f;

        fd.name = "fd";
    }


    //public void spawnfood(float x, float y, FoodType type)
    //{
    //    for (int i = 0; i < FoodMaxPool; i++)
    //    {
    //        if (FoodprefabArray[i] == null)
    //        {
    //            FoodprefabArray[i] = MPool.NewItem();

    //            float z = -(float)food_size;

    //            FoodprefabArray[i].transform.position = new Vector3(x, y, z);
    //            FoodprefabArray[i].transform.localScale = new Vector3(food_size, food_size, food_size);

    //            FoodprefabArray[i].GetComponent<Light>().color = new Color32(255, 255, 255, 255);
    //            FoodprefabArray[i].GetComponent<Light>().range = food_halo_size;

    //            FoodprefabArray[i].GetComponent<foodinfo>().type = type;
    //            break;

    //        }
    //    }
    //}


    /* Food don't need to be updated per frame
    // Update is called once per frame
    void Update()
    {

    }
    */
}
