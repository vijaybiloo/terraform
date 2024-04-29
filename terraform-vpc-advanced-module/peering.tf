### VPC Peering with Default VPC 

resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_requried ? 1 : 0
  # peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.main.id
  # requester, default VPC is our requester
  vpc_id        = var.requester_vpc_id
  auto_accept   = true

  tags = merge(
    {
      Name = "VPC Peering between Default and ${var.project_name}"
    },
    var.common_tags
  )
}

resource "aws_route" "default_route" {
  count = var.is_peering_requried ? 1 : 0
  route_table_id            = var.default_route_table_id
  destination_cidr_block    = var.cidr_block
  # since we are using count even though its single element we have to write or represent it as a list and use list syntax.
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}

resource "aws_route" "public_peering" {
  count = var.is_peering_requried ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}

resource "aws_route" "private_peering" {
  count = var.is_peering_requried ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}

resource "aws_route" "database_peering" {
  count = var.is_peering_requried ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}