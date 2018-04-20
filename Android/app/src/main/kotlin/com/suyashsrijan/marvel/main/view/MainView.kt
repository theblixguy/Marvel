package com.suyashsrijan.marvel.main.view

import com.suyashsrijan.marvel.app.model.ComicItem
import com.suyashsrijan.marvel.main.di.MainComponent

interface MainView {
    fun injectDependencies(mainComponent: MainComponent)
    fun displayComics(comicsList: List<ComicItem>)
    fun setLoadingState(loading: Boolean)
    fun showErrorDialog()
    fun isInternetAvailable(): Boolean
}