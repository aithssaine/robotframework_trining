*** Settings ***
Documentation     API tests for /posts
Resource          ../../resources/api/posts_api.resource
Suite Setup       Create API Session

*** Test Cases ***
Get Single Post
    [Tags]    api    smoke
    ${response}=    Get Post By Id    1
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${json}[id]    1
    Dictionary Should Contain Key    ${json}    title

Get All Posts Returns 100 Items
    [Tags]    api
    ${response}=    Get All Posts
    ${count}=    Get Length    ${response.json()}
    Should Be Equal As Integers    ${count}    100

Create New Post
    [Tags]    api
    ${response}=    Create Post    My Title    My Body
    Should Be Equal As Integers    ${response.status_code}    201
    Should Be Equal    ${response.json()}[title]    My Title

Update Post Title
    [Tags]    api
    ${response}=    Update Post    1    Updated Title
    Should Be Equal    ${response.json()}[title]    Updated Title

Delete Post
    [Tags]    api
    ${response}=    Delete Post    1
    Should Be Equal As Integers    ${response.status_code}    201

Non Existing Post Returns 404
    [Tags]    api    negative
    ${response}=    Get Post By Id    9999    expected_status=404
    Should Be Equal As Integers    ${response.status_code}    404