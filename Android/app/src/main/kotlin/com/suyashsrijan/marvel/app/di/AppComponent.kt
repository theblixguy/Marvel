package com.suyashsrijan.marvel.app.di

import com.suyashsrijan.marvel.app.App
import com.suyashsrijan.marvel.app.di.scopes.PerApplication
import com.suyashsrijan.marvel.main.di.MainComponent
import com.suyashsrijan.marvel.main.di.MainModule
import dagger.Component

@PerApplication
@Component(modules = [(AppModule::class), (NetworkModule::class)])
interface AppComponent {
    fun inject(application: App)
    fun plus(module: MainModule): MainComponent
}