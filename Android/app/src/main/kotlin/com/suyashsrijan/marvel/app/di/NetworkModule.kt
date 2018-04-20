package com.suyashsrijan.marvel.app.di

import com.google.gson.GsonBuilder
import com.suyashsrijan.marvel.app.di.scopes.PerApplication
import com.suyashsrijan.marvel.app.network.api.MarvelAPI
import dagger.Module
import dagger.Provides
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

@Module
class NetworkModule {

    @Provides
    @PerApplication
    fun provideMarvelAPI(): MarvelAPI {
        return Retrofit.Builder()
            .addConverterFactory(GsonConverterFactory.create(GsonBuilder().create()))
            .baseUrl("http://gateway.marvel.com")
            .build()
            .create(MarvelAPI::class.java)
    }

}