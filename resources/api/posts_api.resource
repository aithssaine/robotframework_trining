*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../config.resource

*** Keywords ***
Create API Session
    Create Session    api    ${API_URL}    verify=${True}

Get Post By Id
    [Arguments]    ${post_id}    ${expected_status}=200
    ${response}=    GET On Session    api    /posts/${post_id}    expected_status=${expected_status}
    RETURN    ${response}

Get All Posts
    ${response}=    GET On Session    api    /posts
    RETURN    ${response}

Create Post
    [Arguments]    ${title}    ${body}    ${user_id}=1
    ${payload}=    Create Dictionary    title=${title}    body=${body}    userId=${user_id}
    ${response}=    POST On Session    api    /posts    json=${payload}    expected_status=201
    RETURN    ${response}

Update Post
    [Arguments]    ${post_id}    ${title}
    ${payload}=    Create Dictionary    title=${title}
    ${response}=    PATCH On Session    api    /posts/${post_id}    json=${payload}
    RETURN    ${response}

Delete Post
    [Arguments]    ${post_id}
    ${response}=    DELETE On Session    api    /posts/${post_id}
    RETURN    ${response}