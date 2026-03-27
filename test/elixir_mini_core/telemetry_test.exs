defmodule ElixirMiniCore.TelemetryTest do
  use ElixirMiniCore.DataCase

  alias ElixirMiniCore.Telemetry

  describe "nodes" do
    alias ElixirMiniCore.Telemetry.Node

    import ElixirMiniCore.TelemetryFixtures

    @invalid_attrs %{status: nil, sensor_id: nil}

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Telemetry.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Telemetry.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      valid_attrs = %{status: "some status", sensor_id: "some sensor_id"}

      assert {:ok, %Node{} = node} = Telemetry.create_node(valid_attrs)
      assert node.status == "some status"
      assert node.sensor_id == "some sensor_id"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Telemetry.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      update_attrs = %{status: "some updated status", sensor_id: "some updated sensor_id"}

      assert {:ok, %Node{} = node} = Telemetry.update_node(node, update_attrs)
      assert node.status == "some updated status"
      assert node.sensor_id == "some updated sensor_id"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Telemetry.update_node(node, @invalid_attrs)
      assert node == Telemetry.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Telemetry.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Telemetry.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Telemetry.change_node(node)
    end
  end
end
