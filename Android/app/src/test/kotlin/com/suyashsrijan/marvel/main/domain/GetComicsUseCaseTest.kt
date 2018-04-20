package com.suyashsrijan.marvel.main.domain

import com.google.common.truth.Truth.assertThat
import com.suyashsrijan.marvel.app.model.ComicItem
import com.suyashsrijan.marvel.app.network.enums.SortingOrder
import com.suyashsrijan.marvel.app.network.utils.getUrl
import com.suyashsrijan.marvel.app.repository.MarvelRepository
import com.suyashsrijan.marvel.utils.Dummy
import kotlinx.coroutines.experimental.runBlocking
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.verify
import org.mockito.junit.MockitoJUnitRunner

@RunWith(MockitoJUnitRunner::class)
class GetComicsUseCaseTest {

    @Mock
    private lateinit var mockMarvelRepository: MarvelRepository
    private lateinit var useCase: GetComicsUseCase

    @Before
    fun before() {
        useCase = GetComicsUseCase(mockMarvelRepository)
    }

    @Test
    fun returnsComic() = runBlocking {
        val param: Pair<Int, SortingOrder> = Pair(25, SortingOrder.REVERSE_MODIFIED)

        `when`(
            mockMarvelRepository.getComics(
                param.first,
                param.second
            )
        ).thenReturn(Dummy.DUMMY_COMIC_ITEM_X_MEN)

        val result: List<ComicItem> = useCase.execute(param.first, param.second)

        verify(mockMarvelRepository).getComics(param.first, param.second)
        assertThat(result[0].comicName).isEqualTo(Dummy.DUMMY_COMIC_ITEM_X_MEN.data?.results?.get(0)?.title)
        assertThat(result[0].description).isEqualTo(
            Dummy.DUMMY_COMIC_ITEM_X_MEN.data?.results?.get(
                0
            )?.description
        )
        assertThat(result[0].issueNumber).isEqualTo(
            Dummy.DUMMY_COMIC_ITEM_X_MEN.data?.results?.get(
                0
            )?.issueNumber
        )
        assertThat(result[0].pageCount).isEqualTo(Dummy.DUMMY_COMIC_ITEM_X_MEN.data?.results?.get(0)?.pageCount)
        assertThat(result[0].thumbnailUrl).isEqualTo(
            Dummy.DUMMY_COMIC_ITEM_X_MEN.data?.results?.get(
                0
            )?.thumbnail?.getUrl()
        )
    }
}