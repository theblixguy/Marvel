package com.suyashsrijan.marvel.app

import android.app.Application
import com.suyashsrijan.marvel.BuildConfig
import com.suyashsrijan.marvel.app.di.AppComponent
import com.suyashsrijan.marvel.app.di.AppModule
import com.suyashsrijan.marvel.app.di.DaggerAppComponent
import timber.log.Timber

class App : Application() {
    companion object {
        private lateinit var app: App

        fun get(): App = app
    }

    private lateinit var appComponent: AppComponent

    override fun onCreate() {
        super.onCreate()

        require(BuildConfig.MARVEL_API_PUBLIC_KEY.isNotEmpty()) {
            "Marvel Public API Key is missing from BuildConfig. Please set MARVEL_PUBLIC_API_KEY " +
                    "to a valid key"
        }
        require(BuildConfig.MARVEL_API_PRIVATE_KEY.isNotEmpty()) {
            "Marvel Private API Key is missing from BuildConfig. Please set MARVEL_PRIVATE_API_KEY " +
                    "to a valid key"
        }

        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree());
        }

        app = this

        appComponent = DaggerAppComponent
            .builder()
            .appModule(AppModule(this))
            .build()
        appComponent.inject(this)
    }

    fun getAppComponent(): AppComponent? = appComponent
}