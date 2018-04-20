package com.suyashsrijan.marvel.main.view

import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.LinearLayoutManager
import android.view.View
import com.bumptech.glide.Glide
import com.bumptech.glide.integration.recyclerview.RecyclerViewPreloader
import com.bumptech.glide.util.FixedPreloadSizeProvider
import com.suyashsrijan.marvel.R
import com.suyashsrijan.marvel.app.model.ComicItem
import com.suyashsrijan.marvel.app.network.enums.SortingOrder
import com.suyashsrijan.marvel.main.di.MainComponent
import com.suyashsrijan.marvel.main.presenter.MainPresenter
import com.suyashsrijan.marvel.main.presenter.MainPresenterImpl
import com.suyashsrijan.marvel.main.utils.NetworkUtils
import com.suyashsrijan.marvel.main.view.recyclerview.ComicsAdapter
import kotlinx.android.synthetic.main.activity_main.*
import timber.log.Timber

class MainActivity : AppCompatActivity(), MainView {

    private lateinit var presenter: MainPresenter<MainView>
    private val comicsCount = 25
    private val comicsSortingOrder = SortingOrder.REVERSE_MODIFIED

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setupToolbar()
        setupPresenter()
        setupRecyclerView()
        loadComics()
    }

    override fun injectDependencies(mainComponent: MainComponent) {
        mainComponent.inject(this)
    }

    private fun setupToolbar() {
        toolbar.setTitleTextAppearance(this, R.style.MarvelToolbarFontStyle)
        setSupportActionBar(toolbar)
        supportActionBar?.title = getString(R.string.app_name)
    }

    private fun setupRecyclerView() {
        comicsRecyclerView.layoutManager = LinearLayoutManager(
            applicationContext, LinearLayoutManager.VERTICAL,
            false
        )
        val glideDimens = Pair(
            resources.getInteger(R.integer.glide_image_width),
            resources.getInteger(R.integer.glide_image_height)
        )
        val adapter =
            ComicsAdapter(Glide.with(applicationContext), glideDimens, presenter.comicsList)
        val sizeProvider = FixedPreloadSizeProvider<ComicItem>(
            R.integer.glide_image_width,
            R.integer.glide_image_height
        )
        val comicPreloader: RecyclerViewPreloader<ComicItem> =
            RecyclerViewPreloader<ComicItem>(
                Glide.with(applicationContext),
                adapter,
                sizeProvider,
                3
            )
        comicsRecyclerView.adapter = adapter
        comicsRecyclerView.addOnScrollListener(comicPreloader)
    }

    private fun setupPresenter() {
        presenter = ViewModelProviders.of(this).get(MainPresenterImpl::class.java)
        presenter.attachView(this, lifecycle)
        lifecycle.addObserver(presenter)
    }

    private fun loadComics() {
        if (presenter.comicsList.isEmpty()) {
            presenter.getComics(comicsCount, comicsSortingOrder)
        }
    }

    override fun setLoadingState(loading: Boolean) {
        when (loading) {
            true -> {
                loadingSpinner.visibility = View.VISIBLE
            }
            false -> {
                loadingSpinner.visibility = View.GONE
            }
        }
    }

    override fun displayComics(comicsList: List<ComicItem>) {
        Timber.i("Received data from presenter, displaying comic titles!")
        comicsRecyclerView.adapter.notifyDataSetChanged()
    }

    override fun showErrorDialog() {
        val builder = AlertDialog.Builder(this, R.style.AppCompatAlertDialogStyle)
        builder.setTitle(getString(R.string.error_dialog_title))
        builder.setMessage(getString(R.string.error_dialog_message))
        builder.setPositiveButton(
            getString(R.string.error_dialog_positive_button_text),
            { dialogInterface, _ ->
                dialogInterface.dismiss()
                loadComics()
            })
        builder.setNegativeButton(getString(R.string.error_dialog_negative_button_text), null)
        builder.show()
    }

    override fun isInternetAvailable(): Boolean {
        return NetworkUtils.isNetworkAvailable(applicationContext)
    }
}
