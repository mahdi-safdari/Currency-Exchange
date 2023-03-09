//# A generic class called ResponseModel is defined with three states: LOADING, COMPLETED, and ERROR.
//# This class consists of three fields: status, data, and message.
//# Using the loading, completed, and error constructors, an object of this class can be easily created.
//# toString method is used to convert an object of this class into a string.
//# Also, an Enum called Status is defined and used inside the ResponseModel class.
class ResponseModel<T> {
  late Status status;
  late T data;
  late String message;

  ResponseModel.loading(this.message) : status = Status.LOADING;
  ResponseModel.completed(this.data) : status = Status.COMPLETED;
  ResponseModel.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
