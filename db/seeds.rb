# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
all_errors = []

puts "Initiating seeds...".yellow
###### usuarios

u_username = ["gacollazos", "mdiaz", "javhur", "teacher", "bob", "technician", "admin", "tech", "alice"]
#u_email = ["german.collazos@codescrum.com", "miguel.diaz@codescrum.com", "javhur@gmail.com", "teacher@teacher.com", "student@student.com", "technician@technician.com", "admin@admin.com"]
u_email = u_username.collect {|username| "#{username}@telelab.com"}
u_type = ["Admin", "Admin", "Teacher", "Teacher", "Student", "Technician", "Admin", "Technician", "Student"]

puts "Creating users...".yellow
u_username.size.times do |n|
  User.find_or_create_by_username(:username => u_username[n], :password => '123456', :email => u_email[n], :type => u_type[n], :options => {:faye => {}}, :profile_attributes => {:firstname => u_username[n], :lastname => u_username[n], :codigo => u_username[n].hash.to_s[1,8]})
  puts "  User - #{u_type[n]} #{u_username[n]} created".green
end

###### cursos

c_name = ["redes1", "redes2"]
c_description = ["descripcion1", "descripcion2"]
c_hashed_password = ["123456", "123456"]
c_options = [{:color1 => "red", :color2 => "green"},{:color1 => "blue", :color2 => "orange"}]

puts "Creating cursos...".yellow
c_name.size.times do |n|
  Course.find_or_create_by_name(:name => c_name[n], :description => c_description[n], :hashed_password => c_hashed_password[n], :options => c_options[n])
  puts "  Curso #{c_name[n]} created".green
end

###### dispositivos

d_nombre = ["Router Cisco 1", "Router Cisco 2", "Router Cisco 3", "Switch de VLAN", "Switch 1"]
d_etiqueta = ["R1", "R2", "R3", "SVLAN", "SW1"]
d_categoria = ["router", "router", "router", "switch", "switch"]
d_tipo = ["user", "user", "user", "vlan", "user"]
d_estado = ["ok", "ok", "ok", "ok", "ok"]
d_cluster_id = [1, 2, 3, 4, 5]
d_com = ['COM3', 'COM5', 'COM6', 'COM3', 'COM3']

puts "Creating dispositivos...".yellow
dispositivos = []
d_nombre.size.times do |n|
  dispositivos << Dispositivo.find_or_create_by_nombre(:nombre => d_nombre[n], :etiqueta => d_etiqueta[n], :categoria => d_categoria[n], :tipo => d_tipo[n], :estado => d_estado[n], :cluster_id => d_cluster_id[n], :com => d_com[n])
  puts "  Dispositivo #{d_nombre[n]} created".green
end

router_1 = dispositivos[0]
router_2 = dispositivos[1]
router_3 = dispositivos[2]
vlan_switch = dispositivos[3]
switch_1 = dispositivos[4]

#puts "vlan_switch =  #{vlan_switch},  #{vlan_switch.class} "
#puts "switch_1 =  #{switch_1}, #{switch_1.class}"
#puts "router_1 =  #{router_1}"
#puts "router_2 =  #{router_2}"
#puts "router_3 =  #{router_3}"
#puts "router_4 =  #{router_4}, #{router_4.errors}"
#puts "router_5 =  #{router_5}"
#puts "router_6 =  #{router_6}"

###### puertos

#p_nombre = ["fastEthernet 0/0", "fastEthernet 0/1", "fastEthernet 0/0", "fastEthernet 0/1", "fastEthernet 0/0", "fastEthernet 0/1", "fastEthernet 0/0", "fastEthernet 0/1", "fastEthernet 0/0", "fastEthernet 0/1", "fastEthernet", "fastEthernet", "fastEthernet", "fastEthernet"]
#p_etiqueta = ["1SC", "2SC", "1SC", "2SC", "1SN", "2SN", "1R3C", "2R3C", "1RC", "2RC", "FE_WinXP", "FE_WinXP", "Ubu_Eth0", "Deb_Eth0"]
#p_estado = ["ok", "ok", "bad", "ok", "ok", "ok", "ok", "ok", "ok", "ok", "bad", "ok", "ok", "ok"]
#p_dispositivo_id = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 9]

seed_puertos = [

    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/1", :etiqueta => "FE-01", :estado => 'ok'},  #  0
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/2", :etiqueta => "FE-02", :estado => 'ok'},  #  1
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/3", :etiqueta => "FE-03", :estado => 'ok'},  #  2
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/4", :etiqueta => "FE-04", :estado => 'ok'},  #  3
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/5", :etiqueta => "FE-05", :estado => 'ok'},  #  4
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/6", :etiqueta => "FE-06", :estado => 'ok'},  #  5
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/7", :etiqueta => "FE-07", :estado => 'ok'},  #  6
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/8", :etiqueta => "FE-08", :estado => 'ok'},  #  7

    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/9", :etiqueta => "FE-09", :estado => 'ok'},  #  8
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/10", :etiqueta => "FE-10", :estado => 'ok'}, # 9
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/11", :etiqueta => "FE-11", :estado => 'ok'}, # 10
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/12", :etiqueta => "FE-12", :estado => 'ok'}, # 11
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/13", :etiqueta => "FE-13", :estado => 'ok'}, # 12
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/14", :etiqueta => "FE-14", :estado => 'ok'}, # 13
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/15", :etiqueta => "FE-15", :estado => 'ok'}, # 14
    {:dispositivo_id => vlan_switch.id, :nombre => "fastEthernet 0/16", :etiqueta => "FE-16", :estado => 'ok'}, # 15

    {:dispositivo_id => router_1.id, :nombre => "fastEthernet 0/0", :etiqueta => "FE-00", :estado => 'ok'},     # 16
    {:dispositivo_id => router_1.id, :nombre => "fastEthernet 0/1", :etiqueta => "FE-01", :estado => 'ok'},     # 17

    {:dispositivo_id => router_2.id, :nombre => "fastEthernet 0/0", :etiqueta => "FE-00", :estado => 'ok'},     # 18
    {:dispositivo_id => router_2.id, :nombre => "fastEthernet 0/1", :etiqueta => "FE-01", :estado => 'ok'},     # 19

    {:dispositivo_id => router_3.id, :nombre => "fastEthernet 0/0", :etiqueta => "FE-00", :estado => 'ok'},     # 20
    {:dispositivo_id => router_3.id, :nombre => "fastEthernet 0/1", :etiqueta => "FE-01", :estado => 'ok'},     # 21

    {:dispositivo_id => switch_1.id, :nombre => "fastEthernet 0/1", :etiqueta => "FE-01", :estado => 'ok'},     # 22
    {:dispositivo_id => switch_1.id, :nombre => "fastEthernet 0/2", :etiqueta => "FE-02", :estado => 'ok'},     # 23
    {:dispositivo_id => switch_1.id, :nombre => "fastEthernet 0/3", :etiqueta => "FE-03", :estado => 'ok'},     # 24
    {:dispositivo_id => switch_1.id, :nombre => "fastEthernet 0/4", :etiqueta => "FE-04", :estado => 'ok'},     # 25
    {:dispositivo_id => switch_1.id, :nombre => "fastEthernet 0/5", :etiqueta => "FE-05", :estado => 'ok'},     # 26
    {:dispositivo_id => switch_1.id, :nombre => "fastEthernet 0/6", :etiqueta => "FE-06", :estado => 'ok'}      # 27

]

###### Conexiones fisicas
puts "Connecting physically...".yellow
puertos = []
seed_puertos.each do |puerto_attributes|
  the_puerto = Puerto.find_or_create_by_dispositivo_id_and_etiqueta_and_nombre_and_estado(puerto_attributes[:dispositivo_id], puerto_attributes[:etiqueta],  puerto_attributes[:nombre],  puerto_attributes[:estado])
  if the_puerto.valid? && the_puerto.persisted?
    puertos << the_puerto
    puts "  Puerto #{the_puerto.dispositivo.etiqueta} - #{puertos.last.etiqueta} created".green
  else
    puts "  Puerto #{the_puerto.errors.full_messages.to_sentence}".red
  end
end

# set an array of port-conections form which construct the DeviceConnections
puerto_connections_array = [[0,22], [1,23], [2,24], [3,25], [4,26], [5,27],[6,18],[7,19], [8,16], [9,17],[10,20], [11,21]]
puerto_connections_array.each do |conexion|
  begin
    puerto_a = puertos[conexion.first]
    puerto_b = puertos[conexion.last]
    #ap "  conexion.first #{conexion.first}"
    #ap "  conexion.last #{conexion.last}"
    puts "  Connecting #{puerto_a.id} with #{puerto_b.id} ... ".yellow
    #the_device_con = DeviceConnection.find_or_create_by_puerto_id_and_endpoint_id(:puerto_id => puerto_a.id, :endpoint_id => puerto_b.id)
    puerto_a.conectar_fisicamente puerto_b
    the_device_con = DeviceConnection.last
    #ap the_device_con
  rescue => e
    puts "  DeviceConnection #{e} error".red
    all_errors << "  DeviceConnection #{e} error".red
  end
  if the_device_con && the_device_con.valid? && the_device_con.persisted?
    puts "  DeviceConnection #{the_device_con.fullname} created".green
  elsif the_device_con
    puts "  DeviceConnection #{the_device_con.errors.full_messages.to_sentence}".red
    all_errors << "  DeviceConnection #{the_device_con.errors.full_messages.to_sentence} created".red
  end
end

# Switch 1 to vlan
#puertos[22].conectar_fisicamente puertos[0]
#puertos[23].conectar_fisicamente puertos[1]
#puertos[24].conectar_fisicamente puertos[2]
#puertos[25].conectar_fisicamente puertos[3]
#puertos[26].conectar_fisicamente puertos[4]
#puertos[27].conectar_fisicamente puertos[5]
#
## Router 1 to vlan # R1 R1
#puertos[16].conectar_fisicamente puertos[8]
#puertos[17].conectar_fisicamente puertos[9]
#
## Router 2 to vlan # R2 R2
#puertos[18].conectar_fisicamente puertos[6]
#puertos[19].conectar_fisicamente puertos[7]
#
## Router 3 to vlan # R3 R3
#puertos[20].conectar_fisicamente puertos[10]
#puertos[21].conectar_fisicamente puertos[11]

#### OPEN PRACTICE +FOR DEVS
puts "Creating open practice...".yellow

open_practica = Practica.new
open_practica.name = "Practica de prueba"
open_practica.start = DateTime.now + 4.hours
open_practica.end = DateTime.now + 8.hours
open_practica.abrir
open_practica.users << User.all
open_practica.dispositivos << [router_1, router_2 , router_3]
#open_practica.dispositivos << [router_1, router_2 , router_3, router_4]

if open_practica.save
else
  all_errors << "FAILED TO CREATE PRACTICA, #{open_practica.errors.full_messages.to_sentence}".light_red
end

if all_errors.empty?
  puts "EVERYTHING IS DONE!".light_green
else
  all_errors.each_with_index do |error, i|
    puts "#{"#{i + 1}".cyan} - #{error}"
  end
  puts "Total errors: #{all_errors.count}".red
end

puts "----------------------------------------------".yellow
