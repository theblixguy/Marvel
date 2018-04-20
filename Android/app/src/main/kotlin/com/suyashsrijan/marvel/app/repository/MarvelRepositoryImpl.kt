package com.suyashsrijan.marvel.app.repository

import com.suyashsrijan.marvel.BuildConfig
import com.suyashsrijan.marvel.app.network.api.MarvelAPI
import com.suyashsrijan.marvel.app.network.enums.SortingOrder
import com.suyashsrijan.marvel.app.network.models.Comics
import com.suyashsrijan.marvel.app.network.utils.MarvelAPIUtils
import timber.log.Timber
import javax.inject.Inject

class MarvelRepositoryImpl
@Inject constructor(private val marvelAPI: MarvelAPI) : MarvelRepository {

    override fun getComics(count: Int, order: SortingOrder): Comics? {
        Timber.i("Repository called, calling marvelAPI!")
        val authPair = MarvelAPIUtils().getAuthorizationValues()

        return marvelAPI.getComics(
            authPair.first, BuildConfig.MARVEL_API_PUBLIC_KEY, authPair.second,
            "comic", "comic", count, order.value
        )
            .execute()
            .body()
    }
}