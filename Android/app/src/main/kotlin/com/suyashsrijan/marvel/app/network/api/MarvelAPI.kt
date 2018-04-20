package com.suyashsrijan.marvel.app.network.api

import com.suyashsrijan.marvel.app.network.models.Comics
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface MarvelAPI {

    @GET("/v1/public/comics")
    fun getComics(
        @Query("ts") timeStamp: String,
        @Query("apikey") apiKey: String,
        @Query("hash") hash: String,
        @Query("format") format: String,
        @Query("formatType") formatType: String,
        @Query("limit") limit: Int,
        @Query("orderBy") orderBy: String
    ): Call<Comics>


}