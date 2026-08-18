# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.4.3'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.3/asc_4.4.3_macOS_arm64'
      sha256 'f74f3080c25badf7ef4c6e0b36d4b992ec1af0e2688a21efdbfe4eefeaf3f8be'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.3/asc_4.4.3_macOS_amd64'
      sha256 '840fad5e8ec8646694d00f8cd29c426596d4806d75f50b586be297425d7d0200'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.4.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.4.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
