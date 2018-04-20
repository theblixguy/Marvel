package com.suyashsrijan.marvel.main.view.recyclerview

import android.graphics.Bitmap
import android.support.v7.widget.*
import android.view.View
import com.bumptech.glide.Glide
import com.bumptech.glide.RequestManager
import com.bumptech.glide.request.RequestOptions
import com.bumptech.glide.request.target.SimpleTarget
import com.bumptech.glide.request.transition.Transition
import com.suyashsrijan.marvel.R
import com.suyashsrijan.marvel.app.model.ComicItem
import com.suyashsrijan.marvel.main.utils.random
import kotlinx.android.synthetic.main.comic_card.view.*

class ComicViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    private var placeholdersList: List<Int> = listOf(
        R.drawable.marvel_placeholder1, R.drawable.marvel_placeholder2,
        R.drawable.marvel_placeholder3, R.drawable.marvel_placeholder4
    )

    var comicTitle: AppCompatTextView = itemView.comicTitle
    var comicDescription: AppCompatTextView = itemView.comicDescription
    var comicDescriptionSmall: AppCompatTextView = itemView.comicDescriptionSmall
    var comicThumbnail: AppCompatImageView = itemView.comicThumbnail
    var issueNumber: AppCompatButton = itemView.issueNumber
    var pageCount: AppCompatButton = itemView.pageCount
    private var expandButton: AppCompatImageButton = itemView.expand_button

    fun bindTo(manager: RequestManager, comicItem: ComicItem) {

        manager
            .asBitmap()
            .load(comicItem.thumbnailUrl)
            .apply(
                RequestOptions()
                    .placeholder(placeholdersList.random()!!)
                    .centerCrop()
            )
            .into(object : SimpleTarget<Bitmap>(
                itemView.resources.getInteger(R.integer.glide_image_width),
                itemView.resources.getInteger(R.integer.glide_image_height)
            ) {
                override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                    comicThumbnail.setImageBitmap(resource)
                }
            })

        comicTitle.text = comicItem.comicName ?:
                itemView.context.getString(R.string.no_title_available_for_this_comic)
        comicDescription.text = comicItem.description ?:
                itemView.context.getString(R.string.no_description_available_for_comic)

        comicItem.description?.let { it ->
            comicDescriptionSmall.text = it.take(100).plus("...")
        } ?: run {
            comicDescriptionSmall.text =
                    itemView.context.getString(R.string.no_description_available_for_comic)
        }

        issueNumber.text = itemView.context.getString(R.string.issue_prefix)
            .plus(comicItem.issueNumber.toString())
        pageCount.text = comicItem.pageCount.toString()
            .plus(itemView.context.getString(R.string.pages_suffix))

        expandButton.setOnClickListener { _ ->
            when (comicDescription.visibility) {
                View.VISIBLE -> {
                    val degree: Float = if (expandButton.rotation == 180f) 0f else 180f
                    expandButton.animate().rotation(degree).duration = 200
                    comicDescription.visibility = View.GONE
                }
                View.GONE -> {
                    val degree: Float = if (expandButton.rotation == 180f) 0f else 180f
                    expandButton.animate().rotation(degree).duration = 200
                    comicDescription.visibility = View.VISIBLE
                }
            }
        }
    }

    fun recycle() {
        Glide.with(itemView).clear(comicThumbnail)
        comicThumbnail.setImageDrawable(null)
    }
}