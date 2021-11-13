require "test_helper"

class AtividadeTest < ActiveSupport::TestCase

  test "deve completar uma atividade sem subatividades." do
    atividade = Atividade.new
    subatividade = Subatividade.new
    atividade.completar
    assert_equal(true,atividade.completa)
  end

  test "nao deve completar uma atividade com subatividades incompletas." do
    atividade = Atividade.new
    subatividade = Subatividade.new
    subatividade.atividade = atividade
    subatividade.save
    atividade.completar
    assert_equal(false,atividade.completa)
  end

  test "deve adicionar uma subatividade nova a uma atividade." do
    atividade = Atividade.new
    subatividade = Subatividade.new
    atividade.subatividades << subatividade
    atividade.save
    assert_equal(1,atividade.subatividades.count)
  end

  test "deve remover uma subatividade de uma atividade." do
    atividade = Atividade.new
    subatividade = Subatividade.new
    atividade.subatividades << subatividade
    atividade.save
    atividade.subatividades.delete(subatividade)
    assert_equal(0,atividade.subatividades.count)
  end

  test "deve destruir todas as subatividades de uma atividade quando ela for destruída." do
    atividade = Atividade.new
    subatividade = Subatividade.new
    atividade.subatividades << subatividade
    atividade.save
    atividade.destroy
    assert_equal(0,Subatividade.where(atividade: atividade.id).count)
  end

  test "deve iniciar uma atividade" do
    atividade = Atividade.new
    subatividade = Subatividade.new
    atividade.iniciar
    assert_equal(false,atividade.completa)
  end

end
