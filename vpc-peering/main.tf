provider "aws" {
  region = var.aws_region
}

resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_owner_id = var.peer_owner_id  # Optional if both VPCs are in the same account
  auto_accept   = var.auto_accept

  tags = {
    Name = var.peering_name
  }
}

resource "aws_route" "route_to_peer_vpc1" {
  route_table_id            = var.route_table_id_vpc1
  destination_cidr_block    = var.peer_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "route_to_peer_vpc2" {
  route_table_id            = var.route_table_id_vpc2
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
