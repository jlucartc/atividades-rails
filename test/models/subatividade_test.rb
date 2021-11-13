require "test_helper"

class SubatividadeTest < ActiveSupport::TestCase

  test "deve completar uma subatividade" do
    subatividade = Subatividade.new
    subatividade.completar
    assert_equal(true,subatividade.completa)
  end

  test "deve iniciar uma subatividade" do
    subatividade = Subatividade.new
    subatividade.iniciar
    assert_equal(false,subatividade.completa)
  end

end
