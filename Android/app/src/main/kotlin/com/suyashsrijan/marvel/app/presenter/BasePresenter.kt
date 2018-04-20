package com.suyashsrijan.marvel.app.presenter

import android.arch.lifecycle.Lifecycle
import android.arch.lifecycle.LifecycleObserver

interface BasePresenter<View> : LifecycleObserver {
    fun attachView(view: View, viewLifecycle: Lifecycle)
    fun detachView()
    fun getView(): View?
    fun isViewAttached(): Boolean
    fun onPresenterCreated()
    fun onPresenterDestroy()
}