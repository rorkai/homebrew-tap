# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.6.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.6.1/asc_6.6.1_macOS_arm64'
      sha256 '63cf0cb8f16ce3976d844b135befc4906fe8a4c702ada4beda80a9b6a566d16e'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.6.1/asc_6.6.1_macOS_amd64'
      sha256 '7430c11ecb5d6ef1b8f660c8ebe846f1719fe6c1d1aeaea393445797a4ce3ae4'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.6.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.6.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
