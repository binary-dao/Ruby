require 'socket' # �� ����������� ���������� Ruby

# ��������� TCP ����� (��� ����� ���� ������� � ��-�������, �� � �����
# �� ��������� ����� �������, � ��������������� ����� ������� �������).
# ��� �����, ����� ����� ������� ���������� (�.�. �� �������� ��������) ��
# localhost �� 8000-� �����.
server = TCPServer.open('localhost', 8000)

# ����������� ����.
# ����� ����, ��� ���������� �� ������� ����� ������� - �������
# ����� ��������� ����� � ���������� ��������� - ��������� ��������
# � ������ �����, ����� ������� ����� ������
loop do
  # ��������� �������� ���������� �������. ���� ���������� �� ����� �������,
  # ����� ����� ������� ���, � ��� ���� ���� ������
  # �� ����� �����������.
  client = server.accept
  client_headers = []

  # �������� ������ ������� ���������
  while line = client.gets
    client_headers << line

    # �������� HTTP ������������ \r\n ���
    # ������� ������ � ������, ���������� �� ������������ �������.
    # �������, ���� ������� ��� �� ����� (�.�. �� ������������
    # ������ GET-�������. �������� ���� ��� ������������ ��
    # ������ � POST-�������, � � GET-������� ���� ������-�������� ���).
    break if line == "\r\n"
  end

  # ������ 10 ������. � ������ ��� ��� ����, ����� ����������������� ��� ���.
  # ���������� ������������ ���������� � 2-� ��������� �������� � ���-������� �
  # �� �������, ��� ������ ������ ����� ����������� � ��� ���� ������
  # �������, �.�. �� ����� ����������, ���� ������������ ������ ������. ����� �������
  # �������������� ����������� (�.�. �� ������ � �������) - ����� �������
  # ��������� ������ (��������).
  sleep 1

  # ���������� ����� ������� � ��������� ����������. � ���� ���� ������
  # ���������� ������� ��� �� ���������.
  client.print "HTTP/1.1 200/OK\n"
  client.print "Content-type: text/html\n\n"
  client.print client_headers.join "<br/>"
  client.close
end