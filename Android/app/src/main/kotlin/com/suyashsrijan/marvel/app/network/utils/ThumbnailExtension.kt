package com.suyashsrijan.marvel.app.network.utils

import com.suyashsrijan.marvel.app.network.models.Thumbnail

fun Thumbnail.getUrl(): String? {
    return path.plus(".").plus(extension)
}