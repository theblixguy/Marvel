package com.suyashsrijan.marvel.main.view.recyclerview

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.bumptech.glide.ListPreloader
import com.bumptech.glide.RequestBuilder
import com.bumptech.glide.RequestManager
import com.bumptech.glide.request.RequestOptions
import com.suyashsrijan.marvel.R
import com.suyashsrijan.marvel.app.model.ComicItem
import java.util.*

class ComicsAdapter(
    private val manager: RequestManager,
    private val glideDimens: Pair<Int, Int>,
    private val comicList: List<ComicItem>?
) : RecyclerView.Adapter<ComicViewHolder>(),
    ListPreloader.PreloadModelProvider<ComicItem> {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ComicViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.comic_card, parent, false)

        return ComicViewHolder(view)
    }

    override fun onBindViewHolder(holder: ComicViewHolder, position: Int) {
        val item = comicList!![position]
        holder.bindTo(manager, item)
    }

    override fun onViewRecycled(holder: ComicViewHolder) {
        super.onViewRecycled(holder)
        holder.recycle()
    }

    override fun getItemCount(): Int {
        return comicList?.size ?: 0
    }

    override fun getPreloadItems(position: Int): MutableList<ComicItem> {
        return Collections.singletonList(comicList?.get(position))
    }

    override fun getPreloadRequestBuilder(item: ComicItem): RequestBuilder<*>? {
        return manager
            .asBitmap()
            .load(item.thumbnailUrl)
            .apply(
                RequestOptions()
                    .centerCrop()
                    .override(glideDimens.first, glideDimens.second)
            )
    }
}