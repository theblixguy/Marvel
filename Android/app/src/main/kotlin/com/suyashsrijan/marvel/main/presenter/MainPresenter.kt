package com.suyashsrijan.marvel.main.presenter

import com.suyashsrijan.marvel.app.model.ComicItem
import com.suyashsrijan.marvel.app.network.enums.SortingOrder
import com.suyashsrijan.marvel.app.presenter.BasePresenter


interface MainPresenter<ViewInterface> : BasePresenter<ViewInterface> {

    val comicsList: List<ComicItem>
    fun getComics(count: Int, orderBy: SortingOrder)

}