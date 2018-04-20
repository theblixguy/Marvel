package com.suyashsrijan.marvel.app.presenter

import android.arch.lifecycle.Lifecycle
import android.arch.lifecycle.OnLifecycleEvent
import android.arch.lifecycle.ViewModel

abstract class BasePresenterImpl<View> : BasePresenter<View>, ViewModel() {

    private var viewInstance: View? = null
    private var viewLifecycle: Lifecycle? = null

    protected fun injectDependencies() {
        onInjectDependencies()
    }

    protected open fun onInjectDependencies() {}
    protected open fun onViewAttached(view: View) {}

    @Synchronized
    override fun attachView(view: View, viewLifecycle: Lifecycle) {
        this.viewInstance = view
        this.viewLifecycle = viewLifecycle
        onViewAttached(view)
    }

    @Synchronized
    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    private fun onViewDestroyed() {
        viewInstance = null
        viewLifecycle = null
    }

    override fun detachView() {
        viewInstance = null
    }

    override fun getView(): View? {
        return viewInstance
    }

    override fun isViewAttached(): Boolean {
        return viewInstance != null
    }

    override fun onPresenterCreated() {

    }
}