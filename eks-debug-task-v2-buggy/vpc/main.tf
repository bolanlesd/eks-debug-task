resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index)
  availability_zone = element(["eu-west-1a", "eu-west-1b"], count.index)
}
