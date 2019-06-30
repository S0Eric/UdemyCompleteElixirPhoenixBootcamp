defmodule Identicon do
  @moduledoc """
    Create am identicon image file from an input string.

  ## Examples
    iex> Identicon.main("Mary")
  """

  def main(input) do
    input
    |> hash_string
    |> pick_color
    |> build_grid
    |> build_pixel_blocks
    |> build_image
    |> save_image(input)
  end

  def hash_string(input) do
    bytes =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list
    %Identicon.Image{bytes: bytes}
  end

  def pick_color(%Identicon.Image{bytes: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def build_grid(%Identicon.Image{bytes: bytes} = image) do
    grid =
      bytes
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index
      |> select_set_indexes
    %Identicon.Image{image | grid: grid}
  end

  def mirror_row([v1, v2 | _tail] = row) do
    row ++ [v2, v1]
  end

  def select_set_indexes(grid) do
    for {byte, index} <- grid, rem(byte, 2) == 0 do
      index
    end
  end

  def build_pixel_blocks(%Identicon.Image{grid: grid} = image) do
    pixel_blocks =
      Enum.map grid, fn index ->
        h = rem(index, 5) * 50
        v = div(index, 5) * 50
        {{h, v}, {h + 50, v + 50}}
      end
    %Identicon.Image{image | pixel_blocks: pixel_blocks}
  end

  def build_image(%Identicon.Image{color: color, pixel_blocks: pixel_blocks}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)
    Enum.each pixel_blocks, fn({upper_left, lower_right}) ->
      :egd.filledRectangle(image, upper_left, lower_right, fill)
    end
    :egd.render(image)
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end
end
