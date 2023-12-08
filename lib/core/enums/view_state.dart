enum ViewState {
  idle,
  loading,
  error;

  // const ViewState(this.message);
  // final String message;
}

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;
  bool get isIdle => this == ViewState.idle;
  bool get isError => this == ViewState.error;
}
