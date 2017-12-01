# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170224141358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "empresas", force: :cascade do |t|
    t.string   "razao"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.integer  "veiculo_id"
    t.integer  "motorista_id"
    t.integer  "tipo_evento_id"
    t.date     "data_evento"
    t.date     "data_lancamento"
    t.text     "local"
    t.integer  "motor"
    t.decimal  "velocidade"
    t.decimal  "altitude"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "viagem_id"
  end

  add_index "eventos", ["motorista_id"], name: "index_eventos_on_motorista_id", using: :btree
  add_index "eventos", ["tipo_evento_id"], name: "index_eventos_on_tipo_evento_id", using: :btree
  add_index "eventos", ["veiculo_id"], name: "index_eventos_on_veiculo_id", using: :btree

  create_table "motoristas", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnh"
    t.string   "telefone"
    t.string   "email"
    t.string   "cpf"
    t.integer  "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
  end

  add_index "motoristas", ["empresa_id"], name: "index_motoristas_on_empresa_id", using: :btree

  create_table "parada_empresas", force: :cascade do |t|
    t.integer  "ponto_parada_id"
    t.integer  "empresa_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "parada_empresas", ["empresa_id"], name: "index_parada_empresas_on_empresa_id", using: :btree
  add_index "parada_empresas", ["ponto_parada_id"], name: "index_parada_empresas_on_ponto_parada_id", using: :btree

  create_table "ponto_paradas", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "tipo_parada_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "raio"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "ponto_paradas", ["tipo_parada_id"], name: "index_ponto_paradas_on_tipo_parada_id", using: :btree

  create_table "rastreadores", force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_eventos", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "acao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_paradas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veiculo_motoristas", force: :cascade do |t|
    t.integer  "veiculo_id"
    t.integer  "motorista_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "veiculo_motoristas", ["motorista_id"], name: "index_veiculo_motoristas_on_motorista_id", using: :btree
  add_index "veiculo_motoristas", ["veiculo_id"], name: "index_veiculo_motoristas_on_veiculo_id", using: :btree

  create_table "veiculo_rastreadores", force: :cascade do |t|
    t.integer  "veiculo_id"
    t.integer  "rastreador_id"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "veiculo_rastreadores", ["rastreador_id"], name: "index_veiculo_rastreadores_on_rastreador_id", using: :btree
  add_index "veiculo_rastreadores", ["veiculo_id"], name: "index_veiculo_rastreadores_on_veiculo_id", using: :btree

  create_table "veiculos", force: :cascade do |t|
    t.integer  "empresa_id"
    t.string   "placa"
    t.string   "cor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
  end

  add_index "veiculos", ["empresa_id"], name: "index_veiculos_on_empresa_id", using: :btree

  create_table "viagens", force: :cascade do |t|
    t.integer  "veiculo_id"
    t.integer  "origem"
    t.integer  "destino"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "viagens", ["veiculo_id"], name: "index_viagens_on_veiculo_id", using: :btree

  add_foreign_key "eventos", "motoristas"
  add_foreign_key "eventos", "tipo_eventos"
  add_foreign_key "eventos", "veiculos"
  add_foreign_key "motoristas", "empresas"
  add_foreign_key "parada_empresas", "empresas"
  add_foreign_key "parada_empresas", "ponto_paradas"
  add_foreign_key "ponto_paradas", "tipo_paradas"
  add_foreign_key "veiculo_motoristas", "motoristas"
  add_foreign_key "veiculo_motoristas", "veiculos"
  add_foreign_key "veiculo_rastreadores", "rastreadores"
  add_foreign_key "veiculo_rastreadores", "veiculos"
  add_foreign_key "veiculos", "empresas"
  add_foreign_key "viagens", "veiculos"
end
