alias MoviesApi.Repo
alias MoviesApi.Movie
[
	%Movie{
		original_name: "Dr. No",
		name: "007 contra o Satânico Dr. No / 007 - Agente Secreto"
	}
] |> Enum.each(&Repo.insert!(&1))
