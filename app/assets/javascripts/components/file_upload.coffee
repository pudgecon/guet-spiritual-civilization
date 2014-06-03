App.FileUploadComponent = Ember.Component.extend
  tagName: 'button'
  classNames: ['btn', 'btn-info', 'file-upload']

  uploading: false
  allowFileTypes: ['jpg', 'gif', 'jpge', 'png']

  url: "admin/images"

  checkFileType: true

  didInsertElement: ->
    @$('input.file-upload').fileupload
      url: @get('url')
      refreshUrl: @get('refresh')
      type: 'POST'
      dataType: 'json'
      add: (e, data) =>
        if @get('checkFileType')
          fileName = data.files[0].name
          extIndex = fileName.lastIndexOf(".")
          fileExt = fileName.substr(extIndex + 1)
          unless extIndex > 0 and @get('allowFileTypes').contains(fileExt)
            Notifier.error "请上传以下格式文件：#{@get('allowFileTypes').join(' ')}", "文件格式不正确"
            return

        @set('uploading', true)
        data.submit().complete (jqXHR, status) =>
          @set('uploading', false)
          if jqXHR.status == 200 || jqXHR.status == 201
            @sendAction('action', jqXHR.responseJSON)
            Notifier.success '上传成功'
          else
            Notifier.error '上传失败，请检查格式是否正确！'
