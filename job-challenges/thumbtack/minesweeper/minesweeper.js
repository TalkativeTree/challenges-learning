function Field(fieldWidth){
  init(fieldWidth);
}

Field.prototype = {
  setUpField: function(fieldWidth){
    this.fieldWidth = fieldWidth;
    var numberOfSides = fieldWidth * fieldWidth;
        squares = [];

    for(var i = 0; i < numberOfSides; i ++){
      squares.push(new Square("empty", this));
    }
    this.squares = squares;
  },
  init: function(fieldWidth){
    this.setUpField(fieldWidth);
  }
};
function FieldView(field){
  if (!(this instanceof FieldView)){ return new FieldView(field); }
  this.field = field;
  this.template = $('div').addClass('field');
}

function Minesweeper(){
  this.fieldWidth = fieldWidth || 8;
  this.field = new Field();
}
Minesweeper.prototype = {
  init: function(fieldWidth, mines){
    fieldWidth = fieldWidth || 8;
    mines = mines || 10;
    this.setUpField(fieldWidth);
    this.placeMines(mines);
  }
};