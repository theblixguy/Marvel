package com.suyashsrijan.marvel.app.di

import android.app.Application
import com.suyashsrijan.marvel.app.di.scopes.PerApplication
import com.suyashsrijan.marvel.app.repository.MarvelRepository
import com.suyashsrijan.marvel.app.repository.MarvelRepositoryImpl
import dagger.Module
import dagger.Provides

@Module
class AppModule constructor(private val application: Application) {

    @Provides
    @PerApplication
    internal fun provideMarvelRepository(repository: MarvelRepositoryImpl): MarvelRepository {
        return repository
    }
}
