package com.suyashsrijan.marvel.app.network.utils

import com.suyashsrijan.marvel.BuildConfig
import com.suyashsrijan.marvel.main.utils.toMD5

class MarvelAPIUtils {

    private fun generateHash(timestamp: Long): String {
        val toHash: String = timestamp.toString()
            .plus(BuildConfig.MARVEL_API_PRIVATE_KEY)
            .plus(BuildConfig.MARVEL_API_PUBLIC_KEY)
        return toHash.toMD5()
    }

    private fun generateTimestamp(): Long {
        return System.currentTimeMillis()
    }

    fun getAuthorizationValues(): Pair<String, String> {
        val timeStamp = generateTimestamp()
        val hash = generateHash(timeStamp)
        return Pair(timeStamp.toString(), hash)
    }

}