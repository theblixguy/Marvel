package com.suyashsrijan.marvel.main.presenter

import com.suyashsrijan.marvel.app.App
import com.suyashsrijan.marvel.app.model.ComicItem
import com.suyashsrijan.marvel.app.network.enums.SortingOrder
import com.suyashsrijan.marvel.app.presenter.BasePresenterImpl
import com.suyashsrijan.marvel.main.di.MainComponent
import com.suyashsrijan.marvel.main.di.MainModule
import com.suyashsrijan.marvel.main.domain.GetComicsUseCase
import com.suyashsrijan.marvel.main.view.MainView
import kotlinx.coroutines.experimental.android.UI
import kotlinx.coroutines.experimental.launch
import timber.log.Timber
import javax.inject.Inject

class MainPresenterImpl : BasePresenterImpl<MainView>(), MainPresenter<MainView> {

    @Inject
    internal lateinit var getComicsUseCase: GetComicsUseCase

    private var mainComponent: MainComponent? = null

    private val comics: MutableList<ComicItem> = mutableListOf()

    init {
        injectDependencies()
    }

    override fun onInjectDependencies() {
        mainComponent = App.get()
            .getAppComponent()
            ?.plus(MainModule())

        mainComponent?.inject(this)
    }

    override fun onViewAttached(view: MainView) {
        mainComponent?.let { view.injectDependencies(it) }
    }

    override val comicsList: List<ComicItem>
        get() = comics

    private fun updateComicsList(comicsList: List<ComicItem>) {
        if (comicsList.isEmpty()) {
            Timber.i("Received no data from use case, calling view to display error dialog!")
            getView()?.showErrorDialog()
        } else {
            Timber.i("Received data from use case, calling view to display data!")
            comics.clear()
            comics.addAll(comicsList)
            getView()?.displayComics(comics)
            getView()?.setLoadingState(false)
        }
    }

    override fun getComics(count: Int, orderBy: SortingOrder) {
        when (getView()?.isInternetAvailable()) {
            true -> {
                Timber.i("Presenter getComics called, calling use case!")
                getView()?.setLoadingState(true)
                launch(UI) {
                    updateComicsList(getComicsUseCase.execute(count, orderBy))
                }
            }
            false -> {
                Timber.i("Presenter getComics called, but no internet available!")
                getView()?.showErrorDialog()
            }
        }
    }

    override fun onPresenterDestroy() {

    }
}