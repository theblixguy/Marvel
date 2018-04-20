package com.suyashsrijan.marvel.main.di

import com.suyashsrijan.marvel.app.di.scopes.PerPresenter
import com.suyashsrijan.marvel.main.presenter.MainPresenterImpl
import com.suyashsrijan.marvel.main.view.MainActivity
import dagger.Subcomponent

@PerPresenter
@Subcomponent(modules = [(MainModule::class)])
interface MainComponent {
    fun inject(mainPresenter: MainPresenterImpl)
    fun inject(mainActivity: MainActivity)
}