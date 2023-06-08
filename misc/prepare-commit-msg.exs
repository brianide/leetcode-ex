#!/usr/bin/env elixir
Mix.install [:poison, :httpoison]

defmodule LeetCode do
  @body "{\"query\":\"\\n    query questionOfToday {\\n  activeDailyCodingChallengeQuestion {\\n    date\\n    userStatus\\n    link\\n    question {\\n      acRate\\n      difficulty\\n      freqBar\\n      frontendQuestionId: questionFrontendId\\n      isFavor\\n      paidOnly: isPaidOnly\\n      status\\n      title\\n      titleSlug\\n      hasVideoSolution\\n      hasSolution\\n      topicTags {\\n        name\\n        id\\n        slug\\n      }\\n    }\\n  }\\n}\\n    \",\"variables\":{},\"operationName\":\"questionOfToday\"}"

  defp request_problem_data() do
    token = :crypto.strong_rand_bytes(48) |> Base.encode64()
    HTTPoison.post!("https://leetcode.com/graphql/", @body, ["content-type": "application/json", "x-csrftoken": token])
    |> then(&Poison.decode!(&1.body)["data"]["activeDailyCodingChallengeQuestion"])
  end

  def get_problem_data() do
    %{"date" => date, "link" => link, "question" => %{"title" => title, "frontendQuestionId" => id}} = request_problem_data()
    {date, link, id, title}
  end
end

{date, link, id, title} = LeetCode.get_problem_data()
[path | _] = System.argv()
File.write!(path, "Solution for #{date}\n\n#{id}: #{title}\nhttps://leetcode.com#{link}\n")
