defmodule Rumbl.Repo.Migrations.AddCategoryIdToVideo do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :category_id, references(:categories)
        # The references function accepts the :on_delete option with one of the following:
        # :nothing
        # The default.
        # :delete_all
        # When the category is deleted, all videos in that category are deleted.
        # :nilify_all
        # When a category is deleted, the category_id of all associated videos is set to NULL.
    end
  end
end
