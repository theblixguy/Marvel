package com.suyashsrijan.marvel.app.repository

import com.suyashsrijan.marvel.app.network.enums.SortingOrder
import com.suyashsrijan.marvel.app.network.models.Comics

interface MarvelRepository {

    fun getComics(count: Int, order: SortingOrder): Comics?

}