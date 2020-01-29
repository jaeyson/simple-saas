defmodule PowApp.Api do
  use HTTPoison.Base

  @endpoint "https://holidayapi.com/v1/holidays"

  def get_env_holiday(), do: System.get_env("HOLIDAY_API")

  def query(day, month, year, country, api_key) do
    input_date = ~s(#{year}-#{month}-#{day})
    {:ok, %HTTPoison.Response{body: body}} = get_data(month, year, country, api_key)
    %{"holidays" => holiday} = Jason.decode!(body)

    holiday
    |> Enum.filter(fn
      %{"observed" => observed_date} ->
        observed_date == input_date
    end)
    |> stringify()
  end

  defp get_data(month, year, country, api_key) do
    url = ~s(#{@endpoint}?country=#{country}&year=#{year}&month=#{month}&key=#{api_key})
    headers = [Authorization: "Bearer #{api_key}", Accept: "Application/json; Charset=utf-8"]

    get(url, headers)
  end

  defp stringify([]), do: "no holiday :("
  defp stringify([%{"name" => name}] = _selected_holiday), do: name
end

