package com.suyashsrijan.marvel.app.network.enums

enum class SortingOrder(val value: String) {

    FOC_DATE("focDate"),
    ON_SALE_DATE("onsaleDate"),
    TITLE("title"),
    ISSUE_NUMBER("issueNumber"),
    MODIFIED("modified"),
    REVERSE_FOC_DATE("-focDate"),
    REVERSE_ON_SALE_DATE("-onsaleDate"),
    REVERSE_TITLE("-title"),
    REVERSE_ISSUE_NUMBER("-issueNumber"),
    REVERSE_MODIFIED("-modified");

}