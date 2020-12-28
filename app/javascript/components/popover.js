const init_popover = () => {
  $(function () {
    $('[data-toggle="popover"]').popover({
      container: 'body'
    })
  })
}

export { init_popover };
