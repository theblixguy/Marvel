package com.suyashsrijan.marvel.app.network.models


import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class Result(

    @SerializedName("title")
    @Expose
    var title: String? = null,

    @SerializedName("issueNumber")
    @Expose
    var issueNumber: Int? = null,

    @SerializedName("description")
    @Expose
    var description: Any? = null,

    @SerializedName("pageCount")
    @Expose
    var pageCount: Int? = null,

    @SerializedName("thumbnail")
    @Expose
    var thumbnail: Thumbnail? = null

)
