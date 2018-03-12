defmodule Xpar.Client.BitBucket do

  def get_commit_messages(team, repo_name) do
    response = HTTPoison.get! "https://api.bitbucket.org/2.0/repositories/knav/pairing-demo/commits/"
    {:ok, response_map}= Poison.decode(response.body)
     {:ok, values} = Map.fetch(response_map, "values")
     Enum.map(values, &Map.fetch(&1, "message"))
  end
end
