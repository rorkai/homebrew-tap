# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.15.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.15.0/asc_5.15.0_macOS_arm64'
      sha256 '29b3f747acd94d1dc49884f4c0a7404181ec058c635d0ce20fc4202c930edf22'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.15.0/asc_5.15.0_macOS_amd64'
      sha256 '4945df669cd2b59aeef64f1867c02b11e7f06558c251afbba96227d5b447fd8f'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.15.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.15.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
