scope do
  test "home" do
    get "/"

    assert_equal 200, last_response.status
  end
end
